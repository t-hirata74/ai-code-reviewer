import { DashboardLayout } from "@/components/layout/dashboard-layout";

export default function SettingsPage() {
  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold tracking-tight">Settings</h1>
          <p className="text-muted-foreground">
            Configure your review preferences and account settings
          </p>
        </div>
        
        <div className="text-center py-12">
          <p className="text-muted-foreground">Settings coming soon...</p>
        </div>
      </div>
    </DashboardLayout>
  );
}