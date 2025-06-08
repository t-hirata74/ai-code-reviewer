import { SignInButton } from "@/components/auth/signin-button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { GitBranch, Shield, Zap } from "lucide-react";

export default function Home() {
  return (
    <main className="min-h-screen bg-gradient-to-br from-background to-muted">
      <div className="container mx-auto px-4 py-16">
        <div className="text-center mb-16">
          <div className="flex justify-center mb-6">
            <GitBranch className="h-16 w-16 text-primary" />
          </div>
          <h1 className="text-4xl font-bold tracking-tight mb-4">
            AI Code Reviewer
          </h1>
          <p className="text-xl text-muted-foreground mb-8 max-w-2xl mx-auto">
            Enhance your development workflow with AI-powered code reviews that catch issues, 
            suggest improvements, and help maintain code quality.
          </p>
          <div className="max-w-md mx-auto">
            <SignInButton />
          </div>
        </div>

        <div className="grid md:grid-cols-3 gap-8 max-w-4xl mx-auto">
          <Card>
            <CardHeader>
              <Zap className="h-8 w-8 mb-2 text-primary" />
              <CardTitle>Fast Reviews</CardTitle>
              <CardDescription>
                Get instant feedback on your pull requests with AI-powered analysis
              </CardDescription>
            </CardHeader>
          </Card>

          <Card>
            <CardHeader>
              <Shield className="h-8 w-8 mb-2 text-primary" />
              <CardTitle>Quality Assurance</CardTitle>
              <CardDescription>
                Maintain high code standards with comprehensive quality checks
              </CardDescription>
            </CardHeader>
          </Card>

          <Card>
            <CardHeader>
              <GitBranch className="h-8 w-8 mb-2 text-primary" />
              <CardTitle>GitHub Integration</CardTitle>
              <CardDescription>
                Seamlessly integrates with your existing GitHub workflow
              </CardDescription>
            </CardHeader>
          </Card>
        </div>
      </div>
    </main>
  );
}