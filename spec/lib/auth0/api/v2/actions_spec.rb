require 'spec_helper'
describe Auth0::Api::V2::Actions do
  before :all do
    dummy_instance = DummyClass.new
    dummy_instance.extend(Auth0::Api::V2::Actions)
    @instance = dummy_instance
  end

  context '.actions' do
    it 'is expected to respond to a actions method' do
      expect(@instance).to respond_to(:actions)
    end

    it 'is expected to respond to a get_actions method' do
      expect(@instance).to respond_to(:get_actions)
    end

    it 'is expected to support all optional arguments' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/actions', {
          triggerId: nil,
          actionName: nil,
          deployed: nil,
          per_page: nil,
          page: nil,
          installed: nil
        }
      )

      expect do
        @instance.actions()
      end.not_to raise_error
    end

    it 'is expected to get /api/v2/actions with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/actions', {
        triggerId: 'post-login',
        actionName: 'loginHandler',
        deployed: true,
        per_page: 10,
        page: 1,
        installed: true
      })
      expect do
        @instance.actions(
          'post-login',
          'loginHandler',
          deployed: true,
          per_page: 10,
          page: 1,
          installed: true
        )
      end.not_to raise_error
    end

  end

  context '.action' do
    it 'is expected to respond to a action method' do
      expect(@instance).to respond_to(:action)
      expect(@instance).to respond_to(:get_action)
    end

    it 'is expected to call get request to /api/v2/actions/actions/{id}' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/actions/123'
      )
      expect { @instance.action('123') }.not_to raise_error
    end

    it 'is expected to raise an exception when the action ID is empty' do
      expect { @instance.action(nil) }.to raise_exception(Auth0::MissingActionId)
    end
  end

  context '.create_action' do
    it 'is expected to respond to a create_action method' do
      expect(@instance).to respond_to(:create_action)
    end

    it 'is expected to post to /api/v2/actions' do
      expect(@instance).to receive(:post).with(
        '/api/v2/actions/actions', {
          name: 'test_org'
        })
      expect do
        @instance.create_action(
          name: 'test_org'
        )
      end.not_to raise_error
    end
  end

  context '.delete_action' do
    it 'is expected to respond to a delete_action method' do
      expect(@instance).to respond_to :delete_action
    end

    it 'is expected to call delete to /api/v2/actions/actions/{id}' do
      expect(@instance).to receive(:delete).with('/api/v2/actions/actions/123', { force: false })
      expect { @instance.delete_action('123') }.not_to raise_error
    end

    it 'is expected not to delete /api/v2/actions if action_id is blank' do
      expect(@instance).not_to receive(:delete)
      expect { @instance.delete_action(nil) }.to raise_exception(
        Auth0::MissingActionId
      )
    end
  end

  context '.patch_action' do
    it 'is expected to respond to a patch_action method' do
      expect(@instance).to respond_to(:patch_action)
    end

    it 'is expected to respond to a update_action method' do
      expect(@instance).to respond_to(:update_action)
    end

    it 'is expected to patch /api/v2/actions/actions/{id}' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/actions/actions/123',
        { name: 'name' }
      )

      expect { @instance.patch_action('123', { name: 'name' }) }.not_to raise_error
    end
  end

  context '.execution' do
    it 'is expected to respond to a user method' do
      expect(@instance).to respond_to(:execution)
    end

    it 'is expected to call get request to /api/v2/actions/executions/{id}' do
      expect(@instance).to receive(:get).with('/api/v2/actions/executions/123')
      expect { @instance.execution('123') }.not_to raise_error
    end

    it 'is expected to raise an exception when the execution ID is empty' do
      expect { @instance.execution(nil) }.to raise_exception(Auth0::MissingExecutionId)
    end
  end

  context '.actions_versions' do
    it 'is expected to respond to a user method' do
      expect(@instance).to respond_to(:actions_versions)
    end

    it 'is expected to call get request to /api/v2/actions/actions/{id}/versions' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/actions/123/versions', {
        per_page: nil,
        page: nil
      })
      expect { @instance.actions_versions('123') }.not_to raise_error
    end

    it 'is expected to raise an exception when the action ID is empty' do
      expect { @instance.actions_versions(nil) }.to raise_exception(Auth0::MissingActionId)
    end

    it 'is expected to get /api/v2/actions/actions/{id}/versions with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/actions/123/versions', {
        per_page: 10,
        page: 1
      })
      expect do
        @instance.actions_versions(
          '123',
          per_page: 10,
          page: 1
        )
      end.not_to raise_error
    end
  end

  context '.trigger_bindings' do
    it 'is expected to respond to a trigger_bindings method' do
      expect(@instance).to respond_to(:trigger_bindings)
      expect(@instance).to respond_to(:get_trigger_bindings)
    end

    it 'is expected to call get request to /api/v2/actions/triggers/{id}/bindings' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/triggers/123/bindings', {
        per_page: nil,
        page: nil
      })
      expect { @instance.trigger_bindings('123') }.not_to raise_error
    end

    it 'is expected to raise an exception when the action_id ID is empty' do
      expect { @instance.trigger_bindings(nil) }.to raise_exception(Auth0::MissingTriggerId)
    end

    it 'is expected to get /api/v2/actions/triggers/{id}/bindings with custom parameters' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/triggers/123/bindings', {
        per_page: 10,
        page: 1
      })
      expect do
        @instance.trigger_bindings(
          '123',
          per_page: 10,
          page: 1
        )
      end.not_to raise_error
    end
  end


  context '.patch_trigger_bindings' do
    it 'is expected to respond to a patch_trigger_bindings method' do
      expect(@instance).to respond_to(:patch_trigger_bindings)
      expect(@instance).to respond_to(:update_trigger_bindings)
    end

    it 'is expected to patch /api/v2/actions/triggers/{id}/bindings' do
      expect(@instance).to receive(:patch).with(
        '/api/v2/actions/triggers/post-login/bindings',
        { name: 'name' }
      )
      expect { @instance.patch_trigger_bindings('post-login', { :name => 'name' }) }.not_to raise_error
    end

    it 'is expected to raise an exception when the trigger ID is empty' do
      expect { @instance.patch_trigger_bindings(nil) }.to raise_exception(Auth0::MissingTriggerId)
    end

    it 'is expected to raise an exception when the body is empty' do
      expect { @instance.patch_trigger_bindings('post-login') }.to raise_exception(Auth0::InvalidParameter)
    end
  end

  context '.action_by_version' do
    it 'is expected to respond to a action_by_version method' do
      expect(@instance).to respond_to(:action_by_version)
      expect(@instance).to respond_to(:get_action_by_version)
    end

    it 'is expected to call get request to /api/v2/actions/actions/{id}/versions/{version_id}' do
      expect(@instance).to receive(:get).with(
        '/api/v2/actions/actions/123/versions/v1'
      )
      expect { @instance.action_by_version('123', 'v1') }.not_to raise_error
    end

    it 'is expected to raise an exception when the action ID is empty' do
      expect { @instance.action_by_version(nil, nil) }.to raise_exception(Auth0::MissingActionId)
    end
    
    it 'is expected to raise an exception when the version ID is empty' do
      expect { @instance.action_by_version('123', nil) }.to raise_exception(Auth0::MissingVersionId)
    end
  end

  context '.deploy_action' do
    it 'is expected to respond to a deploy_action method' do
      expect(@instance).to respond_to(:deploy_action)
    end

    it 'is expected to call post request to /api/v2/actions/actions/{id}/deploy' do
      expect(@instance).to receive(:post).with(
        '/api/v2/actions/actions/123/deploy'
      )
      expect { @instance.deploy_action('123') }.not_to raise_error
    end

    it 'is expected to raise an exception when the action ID is empty' do
      expect { @instance.deploy_action(nil) }.to raise_exception(Auth0::MissingActionId)
    end
  end

  context '.test_action' do
    it 'is expected to respond to a test_action method' do
      expect(@instance).to respond_to(:test_action)
    end

    it 'is expected to raise an exception when the action ID is empty' do
      expect { @instance.test_action(nil) }.to raise_exception(Auth0::MissingActionId)
    end

    it 'is expected to post to /api/v2/actions/{id}/test' do
      expect(@instance).to receive(:post).with(
        '/api/v2/actions/actions/123/test',
          { name: 'test_org' }
        )
      expect do
        @instance.test_action(
          '123',
          name: 'test_org'
        )
      end.not_to raise_error
    end
  end

  context '.rollback_action' do
    it 'is expected to respond to a rollback_action method' do
      expect(@instance).to respond_to(:rollback_action)
    end

    it 'is expected to call post request to /api/v2/actions/actions/{id}/versions/{version_id}/deploy' do
      expect(@instance).to receive(:post).with(
        '/api/v2/actions/actions/123/versions/v1/deploy'
      )
      expect { @instance.rollback_action('123', 'v1') }.not_to raise_error
    end

    it 'is expected to raise an exception when the action ID is empty' do
      expect { @instance.rollback_action(nil, nil) }.to raise_exception(Auth0::MissingActionId)
    end
    
    it 'is expected to raise an exception when the version ID is empty' do
      expect { @instance.rollback_action('123', nil) }.to raise_exception(Auth0::MissingVersionId)
    end
  end
end
