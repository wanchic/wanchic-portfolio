require "rails_helper"
require "pg"

RSpec.shared_examples 'db_connection' do |rails_env, dbs|
  context "with #{rails_env} environment" do
    dbs.each do |label, env_var|
      it "includes the #{label} database", :manual do
        expect(existing_databases).to include(ENV[env_var])
      end
    end
  end
end

RSpec.describe "Database Presence" do
  let(:connection) do
    PG.connect(
      host: ENV.fetch("PG_HOST"),
      port: ENV.fetch("PG_PORT", 5432),
      dbname: "postgres",
      user: ENV.fetch("PG_USER"),
      password: ENV.fetch("PG_PASSWORD")
    )
  end

  let(:existing_databases) do
    connection.exec(<<~SQL).map { |row| row["datname"] }
      SELECT datname
      FROM pg_database
      WHERE datistemplate = false
    SQL
  end

  after do
    connection&.close
  end

  it_behaves_like 'db_connection', 'production', [
    [ 'primary', "PG_DATABASE_PRO" ],
    [ 'cache', "PG_DATABASE_CACHE" ],
    [ 'queue', "PG_DATABASE_QUEUE" ],
    [ 'cable', "PG_DATABASE_CABLE" ]
  ]

  it_behaves_like 'db_connection', 'test', [ [ 'test', "PG_DATABASE_TEST" ] ]
  it_behaves_like 'db_connection', 'development', [ [ 'primary', "PG_DATABASE_DEV" ] ]
end
