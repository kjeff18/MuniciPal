import React, { useState, useEffect } from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { useAuthenticator } from "@aws-amplify/ui-react";
import Home from "./Components/Home";

const AppRoutes = () => {
  const { route } = useAuthenticator((context) => [context.route]);
  const [loading, setLoading] = useState(true);
  const { authStatus } = useAuthenticator((context) => [context.authStatus]);
  const [userGroup, setUserGroup] = useState("");

  const getRoutesForUserGroup = (userGroup) => {
    switch (userGroup) {
      case "Government":
        return (
            <>
                <Route path="/government-home" element={<Home/>} />
            </>
        );
      case "Contractor":
        return (
            <> 
                <Route path="/contractor-home" element={<Home />} />
            </>
        );
      // Add more cases as needed for different user groups
      default:
        // Default case if userGroup doesn't match or is undefined
        return <div>No access or invalid user group</div>;
    }
  };
  
  useEffect(() => {
    if (authStatus === "authenticated") {
      (async () => {
        try {
          // Get current session to validate authentication
          const session = await Auth.currentSession();

          // Session is valid, fetch user info and group
          const user = await Auth.currentAuthenticatedUser();
          const { attributes } = user;
          const userGroup = user.signInUserSession.idToken.payload["cognito:groups"][0];

          // Set the user state with fetched data
          setUser(fetchedUser);
          setUserGroup(userGroup);
          setLoading(false);
        } catch (error) {
          console.log("Session check failed", error);
          // Handle session check failure here, e.g., redirect to login
          setLoading(false);
        }
      })();
    }

    return () => {};
  }, [userGroup, authStatus]);
  
  return (
    <BrowserRouter>
        <Routes>
            {getRoutesForUserGroup(userGroup)}
            <Route path="/*" element={
                <div className="overflow-x-hidden bg-white text-dark">
                    <Home />
                </div>
            }/>
        </Routes>
    </BrowserRouter>
  );
};

export default AppRoutes;