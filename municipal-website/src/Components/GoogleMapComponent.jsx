import React from 'react';
import { GoogleMap, LoadScript, Marker } from '@react-google-maps/api';

// Set the style and center of the map
const mapContainerStyle = {
  width: '100%',
  height: '100%'
};

// Center the map on Baton Rouge
const center = {
  lat: 30.4515, // Latitude for Baton Rouge
  lng: -91.1871 // Longitude for Baton Rouge
};

// Path to the Light image
const lightIconPath = "/Users/sahithirampally/MuniciPal/municipal-website/src/assets/Map_Icons/Light.png";

const GoogleMapComponent = () => {
  return (
    <LoadScript googleMapsApiKey={import.meta.env.VITE_GOOGLE_MAPS_API_KEY}>
      <GoogleMap
        mapContainerStyle={mapContainerStyle}
        center={center}
        zoom={12}
      >
        {/* Marker with custom light icon */}
        <Marker
          position={center}
          icon={{
            url: lightIconPath, // Path to your Light icon image
            scaledSize: { width: 40, height: 40 }, // Adjust size of the icon
          }}
        />
      </GoogleMap>
    </LoadScript>
  );
};

export default GoogleMapComponent;
