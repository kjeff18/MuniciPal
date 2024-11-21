import React from "react";
import { useNavigate } from "react-router-dom";
import "./MapPage.css";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";
import { FaHome, FaProjectDiagram, FaUserCircle } from "react-icons/fa";
import GoogleMapComponent from "./GoogleMapComponent";

const MapPage = () => {
  const navigate = useNavigate(); // Navigation hook

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
          <button className="icon-button" onClick={() => navigate("/login")}>
            <FaUserCircle className="icon" />
            <span>Account</span>
          </button>
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
