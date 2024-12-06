import React from "react";
import { Authenticator } from "@aws-amplify/ui-react";
import AppRoutes from "./AppRoutes";
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Home from "./Components/Home";
import LoginScreen from "./Components/LoginScreen";
import SignUp from "./Components/SignUp";
import MapPage from "./Components/MapPage";
import MyProjects from "./Components/MyProjects";

const App = () => {
  return (
    <Authenticator.Provider>
      <Router>
        <Routes>
          {/* Default Route */}
          <Route path="/" element={<Home />} />

          {/* Define routes for different components */}
          <Route path="/map" element={<MapPage />} />
          <Route path="/projects" element={<MyProjects />} />
          <Route path="/login" element={<LoginScreen />} />
          <Route path="/signup" element={<SignUp />} />
          <Route path="/home" element={<Home />} />
        </Routes>
      </Router>
      </Authenticator.Provider>
  );
};

export default App;
