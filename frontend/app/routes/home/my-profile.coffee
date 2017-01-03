`import Ember from 'ember'`

myProfileRoute = Ember.Route.extend
  model: ->
    @store.findAll('user')

  setupController: (controller,model)->
    controller.set('users', model)
    controller.set('selectedUser',@get('session.user'))

  actions:
    editPost: (post)->
      @transitionTo('home.post.edit', {queryParams: {postId: post.get('id')}})

    updateUser: (selectedUser)->
      selectedUser.save().then((resp) =>
        alert("User Updated")
      )

`export default myProfileRoute`
