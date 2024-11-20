// GoogleMapComponent.js
import React from 'react';
import { GoogleMap, LoadScript } from '@react-google-maps/api';

// Set the style and center of the map
const mapContainerStyle = {
    width: '100%',
    height: '100%'
};

const center = {
    lat: 30.4077, // Latitude for New York (example)
    lng: -91.1794 // Longitude for New York (example)
};


const GoogleMapComponent = () => {

    return (
        <LoadScript googleMapsApiKey={import.meta.env.VITE_GOOGLE_MAPS_API_KEY}>
            <GoogleMap
                mapContainerStyle={mapContainerStyle}
                center={center}
                zoom={12}
            >
            </GoogleMap>
        </LoadScript>
    );
};

export default GoogleMapComponent;
