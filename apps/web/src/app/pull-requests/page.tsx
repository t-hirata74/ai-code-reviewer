import { DashboardLayout } from "@/components/layout/dashboard-layout";

export default function PullRequestsPage() {
  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold tracking-tight">Pull Requests</h1>
          <p className="text-muted-foreground">
            View and manage pull request reviews
          </p>
        </div>
        
        <div className="text-center py-12">
          <p className="text-muted-foreground">Pull request management coming soon...</p>
        </div>
      </div>
    </DashboardLayout>
  );
}