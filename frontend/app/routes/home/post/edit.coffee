`import Ember from 'ember'`

editpostRoute = Ember.Route.extend
  queryParams: {
    postId: {
      refreshModel: true
    }
  }
  model: (params)->
    @store.find('post', params.postId)

  setupController: (controller, model)->
    controller.set('post', model)

  actions:
    updatePost: (post)->
      post.save().then((resp)=>
        alert("Post Updated")
      )


`export default editpostRoute`
