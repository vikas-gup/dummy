`import Ember from 'ember'`

signInRoute = Ember.Route.extend
  beforeModel: ->
    if Ember.isPresent(@get('session.user'))
      @transitionTo('home')
    else
      @transitionTo('sign_in')
      
  model: ->
    []

  setupController: (controller,model)->
    controller.set('model', model)

  actions:
    login: ->
      if Ember.isPresent(@controller.get('email')) and Ember.isPresent(@controller.get('password'))
        that = this
        $.ajax(
          type: 'POST'
          url: '/sign_in'
          data: {email: @controller.get('email'), password: @controller.get('password')}
        ).then((data) =>
          alert data.message
          if Ember.isPresent(data.current_user)
            @get('session').set('user', data.current_user)
            @transitionTo('home')
        )
      else
        alert("Please enter email and password")


`export default signInRoute`
