import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { GitPullRequest, Clock } from 'lucide-react'

interface Review {
  id: string
  pullRequest: {
    title: string
    number: number
    repository: string
  }
  score: number
  status: 'completed' | 'pending' | 'failed'
  createdAt: string
  author: {
    name: string
    avatar?: string
  }
}

const mockReviews: Review[] = [
  {
    id: '1',
    pullRequest: {
      title: 'Add user authentication feature',
      number: 42,
      repository: 'frontend-app',
    },
    score: 8,
    status: 'completed',
    createdAt: '2 hours ago',
    author: {
      name: 'John Doe',
      avatar: '/avatars/01.png',
    },
  },
  {
    id: '2',
    pullRequest: {
      title: 'Fix memory leak in data processing',
      number: 38,
      repository: 'backend-api',
    },
    score: 9,
    status: 'completed',
    createdAt: '5 hours ago',
    author: {
      name: 'Jane Smith',
      avatar: '/avatars/02.png',
    },
  },
  {
    id: '3',
    pullRequest: {
      title: 'Update API documentation',
      number: 35,
      repository: 'docs',
    },
    score: 7,
    status: 'pending',
    createdAt: '1 day ago',
    author: {
      name: 'Bob Johnson',
    },
  },
]

export function RecentReviews() {
  const getStatusColor = (status: Review['status']) => {
    switch (status) {
      case 'completed':
        return 'bg-green-100 text-green-800'
      case 'pending':
        return 'bg-yellow-100 text-yellow-800'
      case 'failed':
        return 'bg-red-100 text-red-800'
      default:
        return 'bg-gray-100 text-gray-800'
    }
  }

  const getScoreColor = (score: number) => {
    if (score >= 8) return 'text-green-600'
    if (score >= 6) return 'text-yellow-600'
    return 'text-red-600'
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Recent Reviews</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="space-y-4">
          {mockReviews.map((review) => (
            <div
              key={review.id}
              className="flex items-center space-x-4 rounded-lg border p-3"
            >
              <Avatar className="h-8 w-8">
                <AvatarImage src={review.author.avatar} />
                <AvatarFallback>
                  {review.author.name.split(' ').map(n => n[0]).join('')}
                </AvatarFallback>
              </Avatar>
              
              <div className="flex-1 space-y-1">
                <div className="flex items-center space-x-2">
                  <GitPullRequest className="h-4 w-4 text-muted-foreground" />
                  <span className="text-sm font-medium">
                    {review.pullRequest.repository}#{review.pullRequest.number}
                  </span>
                </div>
                <p className="text-sm text-muted-foreground">
                  {review.pullRequest.title}
                </p>
                <div className="flex items-center space-x-2 text-xs text-muted-foreground">
                  <Clock className="h-3 w-3" />
                  <span>{review.createdAt}</span>
                </div>
              </div>
              
              <div className="flex items-center space-x-2">
                <Badge className={getStatusColor(review.status)}>
                  {review.status}
                </Badge>
                {review.status === 'completed' && (
                  <span className={`text-sm font-semibold ${getScoreColor(review.score)}`}>
                    {review.score}/10
                  </span>
                )}
              </div>
            </div>
          ))}
        </div>
      </CardContent>
    </Card>
  )
}