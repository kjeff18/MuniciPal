import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { FaEnvelope, FaLock } from "react-icons/fa";
const Auth = (await import("aws-amplify")).Auth;
import Logo from "../assets/Logo.png"; // Import the logo
import "./LoginScreen.css"; // Import CSS for styling

const LoginScreen = ({ isOpen, onClose }) => {
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");

    try {
      // Authenticate user with Amplify
      const user = await Auth.signIn(formData.email, formData.password);
      console.log("Login successful:", user);
      alert("Login successful!");
      navigate("/map");
      // Redirect or handle post-login logic here
    } catch (err) {
      console.error("Login failed:", err);
      setError(err.message || "Login failed. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  if (!isOpen) return null;

  return (
    <div className="login-modal-overlay">
      <div className="login-modal-container">
        {/* Close button */}
        <button onClick={onClose} className="close-button">
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

            {/* Error Message */}
            {error && <p className="error-message">{error}</p>}

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
              disabled={loading}
            >
              {loading ? "Logging in..." : "Log In"}
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
