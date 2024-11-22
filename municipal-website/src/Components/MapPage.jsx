import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./MapPage.css";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";
import { FaHome, FaProjectDiagram, FaUserCircle, FaSignOutAlt } from "react-icons/fa";
import GoogleMapComponent from "./GoogleMapComponent";

const MapPage = () => {
  const navigate = useNavigate(); // Navigation hook
  const [showDropdown, setShowDropdown] = useState(false); // State for dropdown visibility

  const handleAccountClick = () => {
    setShowDropdown(!showDropdown); // Toggle dropdown visibility
  };

  const handleLogout = () => {
    navigate("/home"); // Navigate to the home screen on logout
  };

  return (
    <div className="map-page">
      {/* Header containing logo and menu icons */}
      <div className="header">
        <div className="logo-container">
          <img src={Logo} alt="MuniciPal Logo" className="logo" />
          <img src={TitleImage} alt="Title" className="title-image" />
        </div>
        <div className="menu-icons">
          <button className="icon-button" onClick={() => navigate("/map")}>
            <FaHome className="icon" />
            <span>Home</span>
          </button>
          <button className="icon-button" onClick={() => navigate("/projects")}>
            <FaProjectDiagram className="icon" />
            <span>My Projects</span>
          </button>
          {/* Account button with dropdown */}
          <div className="account-menu">
            <button className="icon-button account-button" onClick={handleAccountClick}>
              <FaUserCircle className="icon" />
              <span>Account</span>
            </button>
            {showDropdown && (
              <div className="dropdown-menu modern">
                <button onClick={handleLogout} className="dropdown-item">
                  <FaSignOutAlt className="dropdown-icon" />
                  Logout
                </button>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Map container */}
      <div className="map-placeholder">
        <GoogleMapComponent />
      </div>
    </div>
  );
};

export default MapPage;
