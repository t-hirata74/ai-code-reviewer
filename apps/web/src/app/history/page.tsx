import { DashboardLayout } from "@/components/layout/dashboard-layout";

export default function HistoryPage() {
  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold tracking-tight">Review History</h1>
          <p className="text-muted-foreground">
            Browse your complete review history and analytics
          </p>
        </div>
        
        <div className="text-center py-12">
          <p className="text-muted-foreground">Review history coming soon...</p>
        </div>
      </div>
    </DashboardLayout>
  );
}