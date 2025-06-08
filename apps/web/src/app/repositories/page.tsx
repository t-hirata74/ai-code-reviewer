import { DashboardLayout } from "@/components/layout/dashboard-layout";

export default function RepositoriesPage() {
  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold tracking-tight">Repositories</h1>
          <p className="text-muted-foreground">
            Manage your connected repositories and review settings
          </p>
        </div>
        
        <div className="text-center py-12">
          <p className="text-muted-foreground">Repository management coming soon...</p>
        </div>
      </div>
    </DashboardLayout>
  );
}