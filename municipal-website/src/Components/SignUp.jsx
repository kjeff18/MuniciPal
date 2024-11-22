import React, { useState } from "react";
import "./SignUp.css";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";
import GovernmentImage from "../assets/GovernmentImage.png"; 
import ContractorImage from "../assets/ContractorImage.png";


const SignUp = ({ isOpen, onClose }) => {
  const [userType, setUserType] = useState("government");

  if (!isOpen) return null;

  const handleUserTypeChange = (type) => {
    setUserType(type);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    alert("SignUp Submitted!");
    onClose();
  };

  return (
    <div className="signup-modal">
      <div className="signup-content">
        <div className="signup-layout">
          <div className="left-side">
            {userType === "government" && (
              <img
                src={GovernmentImage}
                alt="Government Official"
                className="user-type-image"
              />
            )}
            {userType === "contractor" && (
              <img
                src={ContractorImage}
                alt="Contractor"
                className="user-type-image"
              />
            )}
          </div>
          <div className="right-side">
            {/* Logo Section */}
            <div className="signup-header">
              <img src={Logo} alt="Logo" className="logo" />
              <img src={TitleImage} alt="MuniciPal Title" className="title-image" />
              <h2>Create your account</h2>
            </div>

            <button className="close-btn" onClick={onClose}>
              ×
            </button>

            {/* User Type Toggle */}
            <div className="user-type-toggle">
              <button
                onClick={() => handleUserTypeChange("government")}
                className={`user-type-btn ${userType === "government" ? "active" : ""}`}
              >
                Government Official
              </button>
              <button
                onClick={() => handleUserTypeChange("contractor")}
                className={`user-type-btn ${userType === "contractor" ? "active" : ""}`}
              >
                Contractor
              </button>
            </div>

            {/* Form */}
            <form onSubmit={handleSubmit} className="signup-form">
              <input type="email" placeholder="Enter your email" required />
              <input type="password" placeholder="Enter your password" required />
              <input type="password" placeholder="Re-enter your password" required />
              <button type="submit" className="signup-btn">
                Sign up
              </button>
            </form>

            {/* Login Link */}
            <div className="login-link">
              Already have an account?{" "}
              <button onClick={onClose} className="login-btn">
                Log in!
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SignUp;