`import Ember from 'ember'`

signInRoute = Ember.Route.extend
  beforeModel: ->
    unless Ember.isPresent(@get('session.user'))
      @transitionTo('sign_in')
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

`export default signInRoute`
