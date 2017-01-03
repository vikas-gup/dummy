`import Ember from 'ember'`

postRoute = Ember.Route.extend
  model: ->
    @store.query('post', {complete: true})

  setupController: (controller,model)->
    controller.set('posts', model)

  actions:
    editPost: (post)->
      @transitionTo('home.post.edit')


`export default postRoute`
