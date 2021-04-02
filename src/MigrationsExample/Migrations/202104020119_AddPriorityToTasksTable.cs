using FluentMigrator;

namespace MigrationsExample.Migrations
{
    [Migration(202104020119)]
    public class AddPriorityToTasksTable : AutoReversingMigration
    {
        public override void Up()
        {
            Alter.Table("Tasks")
                .AddColumn("Priority")
                    .AsInt32()
                    .NotNullable()
                    .WithDefaultValue(0);
        }
    }
}