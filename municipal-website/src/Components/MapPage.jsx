import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import GoogleMapReact from "google-map-react";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";
import { FaHome, FaProjectDiagram, FaUserCircle } from "react-icons/fa";
import "./MapPage.css";

// Import all images from Map_Icons dynamically
const images = import.meta.glob("../assets/Map_Icons/*", { eager: true });
const imagePaths = Object.values(images).map((img) => img.default);

// Helper to get a random image
const getRandomImage = () => {
  const randomIndex = Math.floor(Math.random() * imagePaths.length);
  return imagePaths[randomIndex];
};

// Helper to calculate marker size based on upvotes
const calculateMarkerSize = (upvotes) => {
  const baseSize = 5; // Minimum size
  const maxSize = 100; // Maximum size
  const scalingFactor = 10; // Multiplier to make differences more pronounced
  const size = baseSize + scalingFactor * Math.log(upvotes);
  return Math.min(size, maxSize); // Cap the size at maxSize
};
// Marker Component
const Marker = ({ imgSrc, size, onClick }) => (
  <div
    className="marker"
    onClick={onClick}
    style={{
      position: "absolute",
      transform: "translate(-50%, -50%)", // Centers the marker on its lat/lng
      width: `${size}px`,
      height: `${size}px`,
    }}
  >
    <img
      src={imgSrc}
      alt="Marker Icon"
      style={{
        width: "100%",
        height: "100%",
      }}
    />
  </div>
);

// Generate Random Markers
const generateMarkers = (center, numMarkers, range) => {
  const markers = [];
  for (let i = 0; i < numMarkers; i++) {
    const randomLat = center.lat + (Math.random() * range - range / 2);
    const randomLng = center.lng + (Math.random() * range - range / 2);
    const upvotes = Math.floor(Math.random() * 400) + 1; // Random upvotes between 1 and 400
    const size = calculateMarkerSize(upvotes); // Calculate size based on upvotes
    markers.push({
      id: i,
      lat: randomLat,
      lng: randomLng,
      imgSrc: getRandomImage(), // Assign random image
      upvotes, // Assign random upvotes
      size, // Assign size based on upvotes
    });
  }
  return markers;
};

const MapPage = () => {
  const navigate = useNavigate();
  const apiKey = import.meta.env.VITE_GOOGLE_MAPS_API_KEY;

  const [selectedMarker, setSelectedMarker] = useState(null); // Track the clicked marker
  const [isSlideOverOpen, setIsSlideOverOpen] = useState(false);
  const [showDropdown, setShowDropdown] = useState(false);

  const center = { lat: 30.4083, lng: -91.1803 }; // Central coordinates
  const markers = generateMarkers(center, 30, 0.06); // 30 markers in a ~0.04° radius

  const handleMarkerClick = (marker) => {
    setSelectedMarker(marker); // Store the clicked marker details
    setIsSlideOverOpen(true); // Open the slider
  };

  const handleAccountClick = () => {
    setShowDropdown(!showDropdown);
  };

  const handleLogout = () => {
    navigate("/home");
  };

  return (
    <div className="map-page">
      {/* Header Section */}
      <div className="header">
        <div className="logo-container">
          <img src={Logo} alt="MuniciPal Logo" className="logo" />
          <img src={TitleImage} alt="Title" className="title-image" />
        </div>
        <div className="menu-icons">
          <button className="icon-button active">
            <FaHome className="icon" />
            <span>Home</span>
          </button>
          <button className="icon-button">
            <FaProjectDiagram className="icon" onClick={() => navigate("/projects")}/>
            <span>My Projects</span>
          </button>
          <button className="icon-button" onClick={() => navigate("/login")}>
            <FaUserCircle className="icon" />
            <span>Account</span>
          </button>
        </div>
      </div>

      {/* Map Container */}
      <div className="map-placeholder">
        <GoogleMapReact
          bootstrapURLKeys={{ key: apiKey }}
          defaultCenter={center}
          defaultZoom={14}
        >
          {markers.map((marker) => (
            <Marker
              key={marker.id}
              lat={marker.lat}
              lng={marker.lng}
              imgSrc={marker.imgSrc}
              size={marker.size}
              onClick={() => handleMarkerClick(marker)} // Pass onClick
            />
          ))}
        </GoogleMapReact>

        {/* Slide-Over */}
        {isSlideOverOpen && (
          <div className="slide-over">
            <div className="slide-over-content">
              <button className="close-button" onClick={() => setIsSlideOverOpen(false)}>
                &times;
              </button>
              <div className="report-card">
                <div className="report-name">
                  <img className="report-image" src={selectedMarker?.imgSrc} alt="Report" />
                  <h1 className="report-text">Marker Details</h1>
                </div>
                <div class="description">Adam Azmi: This street light is broken</div>
                  <div class="report-content">
                    <div class="upvotes">Upvotes: <strong>{selectedMarker?.upvotes}</strong></div>
                  </div>
                  <div class="download-section">
                    <img src="Pictures/duotone.png" alt="Contract Icon"></img>
                    <a href="document.pdf" download>Download RFP</a>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default MapPage;
