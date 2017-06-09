`import Ember from 'ember'`

signInRoute = Ember.Route.extend
  beforeModel: ->
    unless Ember.isPresent(@get('session.user'))
      @transitionTo('sign_in')
  model: ->
    @store.findAll('secret-code')
  setupController: (controller, model) ->
    controller.set('countList', [1, 10 , 100])  
    controller.set('model', model)

  actions:
    logOut: ->
      that = this
      $.ajax(
        type: 'GET'
        url: '/sign_out'
      ).then((data) =>
        alert "Logged Out"
        if Ember.isPresent(@get('session.user'))
          @get('session').set('user', null)
        @transitionTo('sign_in')
      )
    createSecretCode: ->
      count = @controller.get('selectedCount')
      $.ajax(
        type: 'POST'
        url: '/secret_code_create'
        data: {count: count}
      ).then((data) =>
        alert "Created"
      )


`export default signInRoute`
