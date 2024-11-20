import React from "react";
import "./MapPage.css";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";
import { FaHome, FaProjectDiagram, FaUserCircle } from "react-icons/fa"; // Importing icons
import GoogleMapComponent from "./GoogleMapComponent";

const MapPage = () => {
  return (
    <div className="map-page">
      {/* Header containing logo and menu icons */}
      <div className="header">
        <div className="logo-container">
          <img src={Logo} alt="MuniciPal Logo" className="logo" />
          <img src={TitleImage} alt="Title" className="title-image" />
        </div>
        <div className="menu-icons">
          <button className="icon-button">
            <FaHome className="icon" />
            <span>Home</span>
          </button>
          <button className="icon-button">
            <FaProjectDiagram className="icon" />
            <span>My Projects</span>
          </button>
          <button className="icon-button">
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
