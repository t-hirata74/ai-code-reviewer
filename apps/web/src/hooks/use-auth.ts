'use client'

import { useSession } from 'next-auth/react'
import { useEffect } from 'react'
import { setAuthToken, clearAuthToken } from '@/lib/graphql-client'

export function useAuth() {
  const { data: session, status } = useSession()

  useEffect(() => {
    if (session?.accessToken) {
      setAuthToken(session.accessToken)
    } else {
      clearAuthToken()
    }
  }, [session?.accessToken])

  return {
    user: session?.user,
    isAuthenticated: !!session,
    isLoading: status === 'loading',
    accessToken: session?.accessToken,
  }
}