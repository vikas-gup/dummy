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
  @route 'home'
  Router.reopen location: 'history'

`export default Router`
