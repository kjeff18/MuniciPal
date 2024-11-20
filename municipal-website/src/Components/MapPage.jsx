import React from 'react';
import './MapPage.css';
import Logo from "../assets/Logo.png";
import Map from "../assets/Yalla-Abu-Dhabi-Map-2023.jpg";
import GoogleMapComponent from './GoogleMapComponent';




const MapPage = () => {
    return (
        <div className="map-page">
            <div className="map-placeholder">
                <div className="logo-container">
                    <img src={Logo} alt="MuniciPal Logo" className="logo" />
                </div>
                <div className="menu-container">
                    <button className="menu-button">☰</button>
                </div>
                <div className="map-content">
                    <GoogleMapComponent />
                </div>
            </div>
        </div>
    );
};

export default MapPage;