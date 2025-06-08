import { DashboardLayout } from "@/components/layout/dashboard-layout";
import { StatsCard } from "@/components/dashboard/stats-card";
import { RecentReviews } from "@/components/dashboard/recent-reviews";
import { GitPullRequest, CheckCircle, AlertTriangle, TrendingUp } from "lucide-react";

export default function DashboardPage() {
  return (
    <DashboardLayout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold tracking-tight">Dashboard</h1>
          <p className="text-muted-foreground">
            Overview of your code review activity and statistics
          </p>
        </div>

        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
          <StatsCard
            title="Total Reviews"
            value="1,234"
            description="All time reviews completed"
            icon={GitPullRequest}
            trend={{ value: 12, isPositive: true }}
          />
          <StatsCard
            title="Approved PRs"
            value="987"
            description="Pull requests approved"
            icon={CheckCircle}
            trend={{ value: 8, isPositive: true }}
          />
          <StatsCard
            title="Issues Found"
            value="156"
            description="Code issues identified"
            icon={AlertTriangle}
            trend={{ value: 3, isPositive: false }}
          />
          <StatsCard
            title="Code Quality"
            value="8.2/10"
            description="Average quality score"
            icon={TrendingUp}
            trend={{ value: 5, isPositive: true }}
          />
        </div>

        <div className="grid gap-6 lg:grid-cols-2">
          <RecentReviews />
          <div className="space-y-4">
            {/* Placeholder for additional dashboard content */}
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
}