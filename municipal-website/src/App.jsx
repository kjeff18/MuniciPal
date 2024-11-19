import React from "react";
import { Authenticator } from "@aws-amplify/ui-react";
import AppRoutes from "./AppRoutes";

const App = () => {
  return (
    <Authenticator.Provider>
      <AppRoutes />
    </Authenticator.Provider>
  );
};

export default App;
