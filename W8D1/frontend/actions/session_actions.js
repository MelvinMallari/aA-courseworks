import * as APIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

const receiveCurrentUser = (user) => {
  return ({
    type: RECEIVE_CURRENT_USER,
    user,
  });
}

const logoutCurrentUser = () => {
  return ({
    type: LOGOUT_CURRENT_USER,
  });
}

const receiveErrors = (errors) => {
  return ({
    type: LOGOUT_CURRENT_USER,
    errors,
  });
}

export const login = user => dispatch => (
  APIUtil.login(user)
      .then(user => (dispatch(receiveCurrentUser(user))), 
      error => (
          dispatch(receiveErrors(error.responseJSON))
      ))
);

export const logout = () => dispatch => (
  APIUtil.logout()
      .then(payload => (dispatch(logoutCurrentUser())), 
      error => (
          dispatch(receiveErrors(error.responseJSON))
      ))
);

export const signUp = (user) => dispatch => (
  APIUtil.signup()
      .then(user => (dispatch(receiveCurrentUser(user))), 
      error => (
          dispatch(receiveErrors(error.responseJSON))
      ))
);