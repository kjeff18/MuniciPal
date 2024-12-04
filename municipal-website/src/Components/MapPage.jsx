import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./MapPage.css";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";
import { FaHome, FaProjectDiagram, FaUserCircle, FaSignOutAlt } from "react-icons/fa";
import GoogleMapComponent from "./GoogleMapComponent";
import Light from "../assets/Map_Icons/Light.png";

const MapPage = () => {
  const navigate = useNavigate(); // Navigation hook
  const [isSlideOverOpen, setIsSlideOverOpen] = useState(false);
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

      {/* Slide-Over Component */}
      {isSlideOverOpen && (
        <div className="slide-over">
          <div
            className="slide-over-overlay"
            onClick={() => setIsSlideOverOpen(false)}
          ></div>
          <div className="slide-over-content">
            <button
              className="close-button"
              onClick={() => setIsSlideOverOpen(false)}
              aria-label="Close"
            >
              &times;
            </button>
            <h2 className="slide-over-title">Slide-Over Header</h2>
            <p className="slide-over-text">This is the slide-over content.</p>
          </div>
        </div>
      )}

      {/* Map container */}
      <div className="map-placeholder">
        <GoogleMapComponent />
        {/* Light Icon placed on the map */}
        <img
          src={Light}
          alt="Light Icon"
          className="light-icon-on-map"
          onClick={() => setIsSlideOverOpen(true)}
        />
      </div>
    </div>
  );
};

export default MapPage;
