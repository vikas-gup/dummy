`import Ember from 'ember'`

applicationRoute = Ember.Route.extend
  beforeModel: ->
    if Ember.isPresent(@get('session.user'))
      @transitionTo('home')
    else
      @transitionTo('sign_in')

`export default applicationRoute`
