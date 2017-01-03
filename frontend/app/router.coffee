`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend(location: config.locationType)
Router.map ->
  @route 'error404',path: '/*path'
  @route 'error500'
  @route 'error401'
  @route 'passwordedit', path: '/auth/password/edit'
  @route 'sign_in'
  @route 'sign_up'
  @route 'home', ()->
    @route 'post', ()->
      @route 'new'
      @route 'edit'
    @route 'profile'
    @route 'my-profile'
  Router.reopen location: 'history'

`export default Router`
