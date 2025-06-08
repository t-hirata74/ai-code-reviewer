'use client'

import { useQuery } from '@tanstack/react-query'
import { graphqlClient } from '@/lib/graphql-client'
import { 
  GET_CURRENT_USER, 
  GET_REPOSITORIES, 
  GET_PULL_REQUESTS, 
  GET_REVIEWS 
} from '@/lib/graphql/queries'
import type { User, Repository, PullRequest, Review } from '@/types/api'

export function useCurrentUser() {
  return useQuery<{ currentUser: User }>({
    queryKey: ['currentUser'],
    queryFn: () => graphqlClient.request(GET_CURRENT_USER),
  })
}

export function useRepositories() {
  return useQuery<{ repositories: Repository[] }>({
    queryKey: ['repositories'],
    queryFn: () => graphqlClient.request(GET_REPOSITORIES),
  })
}

export function usePullRequests(repositoryId?: string) {
  return useQuery<{ pullRequests: PullRequest[] }>({
    queryKey: ['pullRequests', repositoryId],
    queryFn: () => graphqlClient.request(GET_PULL_REQUESTS, { repository_id: repositoryId }),
  })
}

export function useReviews(pullRequestId?: string) {
  return useQuery<{ reviews: Review[] }>({
    queryKey: ['reviews', pullRequestId],
    queryFn: () => graphqlClient.request(GET_REVIEWS, { pull_request_id: pullRequestId }),
  })
}