require_relative '../../../lib/mince_mongo_db/connection'

describe MinceMongoDb::Connection do
  subject { described_class.instance }

  let(:mongo_connection) { mock 'a mongo connection object', :db => db }
  let(:db) { mock 'db'}
  let(:database_name) { mock }
  let(:database_host) { mock }

  before do
    MinceMongoDb::Config.stub(database_name: database_name, database_host: database_host)
    Mongo::Connection.stub(:new).with(database_host).and_return(mongo_connection)
  end

  it 'is a mongo connection for the configured host' do
    subject.connection = mongo_connection

    subject.connection.should == mongo_connection
  end

  it 'uses the configured database name' do
    mongo_connection.should_receive(:db).with(database_name).and_return(db)
    subject.connection = mongo_connection

    subject.db.should == db
  end
end
