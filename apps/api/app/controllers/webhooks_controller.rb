class WebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :verify_github_signature, only: [:github]

  def github
    event = request.headers['X-GitHub-Event']
    
    case event
    when 'pull_request'
      handle_pull_request(params)
    when 'push'
      handle_push(params)
    end

    head :ok
  end

  private

  def verify_github_signature
    payload_body = request.body.read
    signature = 'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), webhook_secret, payload_body)
    
    unless Rack::Utils.secure_compare(signature, request.headers['X-Hub-Signature-256'])
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def webhook_secret
    ENV.fetch('GITHUB_APP_WEBHOOK_SECRET', '')
  end

  def handle_pull_request(payload)
    action = payload.dig(:action)
    pr_data = payload.dig(:pull_request)
    
    return unless %w[opened synchronize].include?(action)
    
    PullRequestReviewJob.perform_async(
      pr_data[:id],
      pr_data[:base][:repo][:full_name],
      pr_data[:number],
      pr_data[:head][:sha]
    )
  end

  def handle_push(payload)
    return if payload.dig(:ref) != 'refs/heads/main'
    
    # Handle main branch pushes if needed
  end
end