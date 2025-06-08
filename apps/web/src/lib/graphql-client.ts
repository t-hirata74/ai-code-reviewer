import { GraphQLClient } from 'graphql-request'

const endpoint = process.env.NEXT_PUBLIC_API_URL + '/graphql'

export const graphqlClient = new GraphQLClient(endpoint, {
  credentials: 'include',
})

export function setAuthToken(token: string) {
  graphqlClient.setHeader('Authorization', `Bearer ${token}`)
}

export function clearAuthToken() {
  graphqlClient.setHeader('Authorization', '')
}