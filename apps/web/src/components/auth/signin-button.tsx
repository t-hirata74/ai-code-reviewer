'use client'

import { signIn } from 'next-auth/react'
import { Button } from '@/components/ui/button'
import { Github } from 'lucide-react'

export function SignInButton() {
  return (
    <Button
      onClick={() => signIn('github', { callbackUrl: '/dashboard' })}
      size="lg"
      className="w-full"
    >
      <Github className="mr-2 h-5 w-5" />
      Sign in with GitHub
    </Button>
  )
}