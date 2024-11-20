import React, { useState } from "react";
import { FaEnvelope, FaLock } from "react-icons/fa";
import Logo from "../assets/Logo.png"; // Import the logo
import "./LoginScreen.css"; // Import CSS for styling

const LoginScreen = ({ isOpen, onClose }) => {
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Login attempted with:", formData);
  };

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  if (!isOpen) return null;

  return (
    <div className="login-modal-overlay">
      <div className="login-modal-container">
        {/* Close button */}
        <button 
          onClick={onClose}
          className="close-button"
        >
          ×
        </button>

        <div className="modal-content">
          {/* Logo and Title */}
          <div className="logo-title-container">
            <img src={Logo} alt="MuniciPal Logo" className="logo" />
            <h2 className="modal-title">Welcome Back!</h2>
          </div>

          {/* Login Form */}
          <form onSubmit={handleSubmit} className="login-form">
            <div className="input-container">
              {/* Email Input */}
              <div className="input-wrapper">
                <div className="icon-container">
                  <FaEnvelope className="input-icon" />
                </div>
                <input
                  type="email"
                  name="email"
                  value={formData.email}
                  onChange={handleChange}
                  className="input-field"
                  placeholder="Enter your email"
                  required
                />
              </div>

              {/* Password Input */}
              <div className="input-wrapper">
                <div className="icon-container">
                  <FaLock className="input-icon" />
                </div>
                <input
                  type="password"
                  name="password"
                  value={formData.password}
                  onChange={handleChange}
                  className="input-field"
                  placeholder="Enter your password"
                  required
                />
              </div>
            </div>

            {/* Forgot Password Link */}
            <div className="forgot-password-container">
              <a href="#" className="forgot-password-link">
                Forgot password?
              </a>
            </div>

            {/* Login Button */}
            <button
              type="submit"
              className="login-button"
            >
              Log In
            </button>

            {/* Sign Up Link */}
            <p className="signup-link-container">
              Don't have an account?{" "}
              <a href="#" className="signup-link">
                Sign up!
              </a>
            </p>
          </form>
        </div>
      </div>
    </div>
  );
};

export default LoginScreen;
