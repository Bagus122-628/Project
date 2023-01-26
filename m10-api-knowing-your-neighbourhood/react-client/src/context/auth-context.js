import React, { useEffect, useState } from "react"
import { getUserLoginAPI } from "../api/user-api"
import { contextType } from "./context"

const AuthContext = React.createContext(contextType)
// Context Provider
export const AuthContextProvider = (props) => {
  const storedToken = localStorage.getItem("token")
  let initialToken

  if (storedToken) {
    initialToken = storedToken
  }

  // USE STATE
  const [token, setToken] = useState(initialToken)
  const [userProfile, setUserProfile] = useState({})
  const [userStores, setUserStores] = useState([])
  const [userRoles, setUserRoles] = useState([])

  // Check Token (!! = convert to Boolean)
  const userIsLoggedIn = !!token

  // GET USER LOGIN DATA
  useEffect(() => {
    if (token) {
      getUserLoginAPI(token)
        .then((res) => {
          setUserProfile(res.data.profile)
          setUserStores(res.data.stores)
          setUserRoles(res.data.roles)
        })
        .catch((err) => {
          console.log(err)
          logoutHandler()
        })
    }
  }, [token])

  // LOGOUT
  const logoutHandler = () => {
    setToken(null)
    localStorage.removeItem("token")
  }

  // LOGIN
  const loginHandler = (token) => {
    setToken(token)
    localStorage.setItem("token", token)
  }

  // REFRESH USER LOGIN DATA
  const refreshHandler = () => {
    getUserLoginAPI(token)
      .then((res) => {
        setUserProfile(res.data.profile)
        setUserStores(res.data.stores)
        setUserRoles(res.data.roles)
      })
      .catch((err) => {
        console.log(err)
        logoutHandler()
      })
  }

  // Context Value
  const contextValue = {
    userId: userProfile.userId,
    profile: userProfile,
    stores: userStores,
    roles: userRoles,
    token: token,
    isLoggedIn: userIsLoggedIn,
    login: loginHandler,
    logout: logoutHandler,
    refresh: refreshHandler,
  }

  return (
    <AuthContext.Provider value={contextValue}>
      {props.children}
    </AuthContext.Provider>
  )
}

export default AuthContext
