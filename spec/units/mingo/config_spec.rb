require_relative '../../../lib/mingo/config'

describe Mince::Mingo::Config do
  it 'contains the primary key to used by the db interface' do
    described_class.primary_key.should == :_id
  end

  describe 'the database name' do
    subject { described_class.database_name }

    it 'by default is "mince"' do
      subject.should == 'mince'
    end

    it 'can be explicitly defined' do
      described_class.database_name = 'custom_db_name'

      subject.should == 'custom_db_name'

      # Change name back because it is a singleton object
      described_class.database_name = 'mince'
    end

    context 'when running parallel tests' do
      before do
        # Stubbing described_class because the method gets value from an environment
        # variable, which is dangerous to change inside of a test and dangerous to
        # stub
        described_class.stub(:test_env_number => '1')

        # Change name so that the test number is appended
        described_class.database_name = 'mince'
      end

      it 'appends the test number to the db name' do
        subject.should == 'mince-1'
      end
    end
  end
end
