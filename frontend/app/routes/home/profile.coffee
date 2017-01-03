`import Ember from 'ember'`

profileRoute = Ember.Route.extend
  model: ->
    @store.findAll('user')

  setupController: (controller,model)->
    controller.set('users', model)
    controller.set('selectedUser', model.get('firstObject'))


`export default profileRoute`
