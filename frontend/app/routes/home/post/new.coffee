`import Ember from 'ember'`

newpostRoute = Ember.Route.extend
  model: ->
    []

  setupController: (controller, model)->
    newPost = @store.createRecord('post', {title: null, description: null, completed: true})
    controller.set('post', newPost)

  actions:
    createPost: (post)->
      post.save().then((resp)=>
        alert("Post Created")
      )


`export default newpostRoute`
