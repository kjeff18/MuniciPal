import React from "react";
import { useNavigate } from "react-router-dom";
import "./MapPage.css";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";
import { FaHome, FaProjectDiagram, FaUserCircle } from "react-icons/fa";

const ContractorProjects = () => {
  const navigate = useNavigate(); // Navigation hook

  const projects = [
    { name: "Project Alpha", stage: "Bids", status: "OPEN", lastActivity: "2024-11-19" },
    { name: "Project Beta", stage: "Bids", status: "IN_PROGRESS", lastActivity: "2024-10-01" },
    { name: "Project Gamma", stage: "Contract", status: "CLOSED", lastActivity: "2024-09-15" },
  ];

  return (
    <div className="map-page">
      {/* Header Section */}
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
          <button className="icon-button active">
            <FaProjectDiagram className="icon" />
            <span>My Projects</span>
          </button>
          <button className="icon-button" onClick={() => navigate("/login")}>
            <FaUserCircle className="icon" />
            <span>Account</span>
          </button>
        </div>
      </div>

      {/* Table Section */}
      <div className="table-container">
        <table className="projects-table">
          <thead>
            <tr>
              <th>Name</th>
              <th>Stage</th>
              <th>Status</th>
              <th>Last Activity Date</th>
            </tr>
          </thead>
          <tbody>
            {projects.map((project, index) => (
              <tr key={index}>
                <td>{project.name}</td>
                <td>{project.stage}</td>
                <td>
                  <span
                    className={`status ${
                      project.status === "OPEN"
                        ? "status-open"
                        : project.status === "IN_PROGRESS"
                        ? "status-in-progress"
                        : "status-closed"
                    }`}
                  >
                    {project.status.replace("_", " ")} {/* Format status text */}
                  </span>
                </td>
                <td>{project.lastActivity}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default ContractorProjects;
