import React, { useState } from "react"; 
import "./Home.css"; 
import { IoMdMenu } from "react-icons/io";
import { IoIosArrowRoundForward } from "react-icons/io";
import LoginScreen from "./LoginScreen"; 
import SignUp from "./SignUp";

// Importing images
import HeroAvi from "../assets/Hero_Image.avif";
import BannerPng from "../assets/blob.png";
import Logo from "../assets/Logo.png";
import TitleImage from "../assets/MuniciPalTitle.png";

// Importing icons images
import PotholeImg from "/src/assets/Pothole.png";
import StreetLightImg from "/src/assets/Light.png";
import WaterLeakImg from "/src/assets/Pipe.png";
import TrafficSignalImg from "/src/assets/StreetLight.png";
import RoadwayImg from "/src/assets/Road.png";
import SidewalkImg from "/src/assets/Sidewalk.png";
import DrainageImg from "/src/assets/Drainage.png";
import StreetSignImg from "/src/assets/StreetSign.png";
import GraffitiImg from "/src/assets/Graffiti.png";
import ParkMaintenanceImg from "/src/assets/Park_Main.png";
import TreeMaintenanceImg from "/src/assets/Tree_Main.png";
import PedestrianCrossingImg from "/src/assets/Pedestrian.png";

import { motion } from "framer-motion";
import { FaBookReader } from "react-icons/fa";
import { GrUserExpert } from "react-icons/gr";
import { MdOutlineAccessTime } from "react-icons/md";

export const FadeUp = (delay) => ({
  initial: { opacity: 0, y: 50 },
  animate: {
    opacity: 1,
    y: 0,
    transition: { type: "spring", stiffness: 100, duration: 0.5, delay, ease: "easeInOut" },
  },
});

const SlideLeft = (delay) => ({
  initial: { opacity: 0, x: 50 },
  animate: {
    opacity: 1,
    x: 0,
    transition: { duration: 0.3, delay, ease: "easeInOut" },
  },
});

const NavbarMenu = [
  { id: 1, title: "Home", path: "/" },
  { id: 2, title: "About Us", path: "#" },
  { id: 3, title: "Login", path: "#" },
];

const ServicesData = [
  { id: 1, title: "Pothole", link: "#", icon: PotholeImg, delay: 0.2 },
  { id: 2, title: "Street Light", link: "#", icon: StreetLightImg, delay: 0.3 },
  { id: 3, title: "Water Leak", link: "#", icon: WaterLeakImg, delay: 0.4 },
  { id: 4, title: "Traffic Signal", link: "#", icon: TrafficSignalImg, delay: 0.5 },
  { id: 5, title: "Roadway", link: "#", icon: RoadwayImg, delay: 0.6 },
  { id: 6, title: "Sidewalk", link: "#", icon: SidewalkImg, delay: 0.7 },
  { id: 7, title: "Drainage", link: "#", icon: DrainageImg, delay: 0.8 }, 
  { id: 8, title: "Street Sign", link: "#", icon: StreetSignImg, delay: 0.9 },
  { id: 9, title: "Graffiti", link: "#", icon: GraffitiImg, delay: 1.0 },
  { id: 10, title: "Park Maintenance", link: "#", icon: ParkMaintenanceImg, delay: 1.1 },
  { id: 11, title: "Tree Maintenance", link: "#", icon: TreeMaintenanceImg, delay: 1.2 },
  { id: 12, title: "Pedestrian Crossing", link: "#", icon: PedestrianCrossingImg, delay: 1.3 },
];

const Home = () => {
  const [isLoginOpen, setLoginOpen] = useState(false); // State to control login modal visibility
  const [isSignupOpen, setIsSignupOpen] = useState(false);

  const handleLoginOpen = () => {
    console.log("Login button clicked"); 
    setLoginOpen(true); 
  };
  
  const handleLoginClose = () => setLoginOpen(false); 

  const handleSignupOpen = () => {
    setIsSignupOpen(true);
  };

  const handleSignupClose = () => {
    setIsSignupOpen(false);
  };

  return (
    <main>
      {/* Navbar */}
      <nav className="w-full py-4 mb-100">
        <div className="container mx-auto flex justify-between items-center px-10">
          <div className="flex items-center gap-8">
            {/* Logo Image */}
            <img src={Logo} alt="Logo" className="w-10 h-10" /> {/* Adjust size as needed */}
            {/* Title Image */}
            <img src={TitleImage} alt="MuniciPal Title" className="w-32 h-auto" /> {/* Adjust width as needed */}
          </div>
          {/* Navbar Links */}
          <div className="hidden lg:flex items-center gap-6">
            <ul className="flex items-center gap-6">
              {NavbarMenu.map((menu) => (
                <li key={menu.id}>
                  {menu.title === "Login" ? (
                    // Style the "Login" button as an oval with a border
                    <button
                      onClick={handleLoginOpen}
                      className="inline-block py-2 px-5 border-2 border-[#3E7494] text-[#000000] font-bold rounded-full hover:bg-[#3E7494] hover:text-white transition duration-300"
                    >
                      {menu.title}
                    </button>
                  ) : (
                    <a href={menu.path} className="inline-block py-2 px-3 hover:text-secondary">
                      {menu.title}
                    </a>
                  )}
                </li>
              ))}
            </ul>
            {/* Sign In Button */}
            <button
              onClick={handleSignupOpen}
              className="inline-block py-2 px-5 border-2 border-[#0B2E60] text-white font-bold rounded-full hover:bg-opacity-90 transition duration-300"
              style={{
                backgroundColor: '#0B2E60',
              }}
            >
               Sign Up
            </button>
          </div>

          {/* Mobile Menu Icon */}
          <div className="lg:hidden">
            <IoMdMenu className="text-3xl" />
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="bg-light overflow-hidden relative h-screen flex items-center">
        <div className="container grid grid-cols-1 md:grid-cols-2 px-8">
          <div className="flex flex-col justify-center relative z-20 md:pl-16">
            <div className="space-y-10 lg:max-w-[650px]">
              <motion.h1
                variants={FadeUp(0.6)}
                initial="initial"
                animate="animate"
                className="text-3xl lg:text-5xl font-bold leading-tight"
              >
                Your Hub for Reporting <span className="text-[#5AA1BB]">Infrastructure</span> problems and staying informed
              </motion.h1>
              <motion.div variants={FadeUp(0.8)} initial="initial" animate="animate" className="flex justify-start">
                <button className="primary-btn flex items-center gap-2 group">
                  Get Started
                  <IoIosArrowRoundForward className="text-xl group-hover:translate-x-2 group-hover:-rotate-45 duration-300" />
                </button>
              </motion.div>
            </div>
          </div>
          <div className="flex justify-center items-center">
            <motion.img
              initial={{ x: 50, opacity: 0 }}
              animate={{ x: 0, opacity: 1 }}
              transition={{ duration: 0.6, delay: 0.4, ease: "easeInOut" }}
              src={HeroAvi}
              alt="Hero Image"
              className="w-[450px] xl:w-[500px] relative z-10 drop-shadow"
            />
          </div>
        </div>
      </section>

      {/* Services Section */}
      <section className="bg-white py-16">
        <div className="container pb-14 pt-16 px-8">
          <h1 className="text-4xl font-bold text-left pb-10">Types of Report</h1>
          {/* Scrollable container */}
          <div className="flex overflow-x-auto space-x-6 pb-6">
            {ServicesData.map((service) => (
              <motion.div
                key={service.id}
                variants={SlideLeft(service.delay)}
                initial="initial"
                whileInView="animate"
                viewport={{ once: true }}
                className="min-w-[200px] bg-[#5AA1BB] text-white rounded-xl flex flex-col gap-4 items-center justify-center p-4 py-7 hover:scale-110 duration-300 hover:shadow-2xl"
              >
                <img src={service.icon} alt={service.title} className="w-16 h-16 mb-4" />
                <h1 className="text-lg font-semibold text-center px-3">{service.title}</h1>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Banner Section */}
      <section className="py-14 md:py-24 px-8 bg-gray-50">
        <div className="container grid grid-cols-1 md:grid-cols-2 gap-8">
          <div className="flex justify-center items-center">
            <motion.img
              initial={{ opacity: 0, x: -50 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, ease: "easeInOut" }}
              src={BannerPng}
              alt="Banner"
              className="w-[400px] md:w-[500px] object-cover drop-shadow-lg"
            />
          </div>
          <div className="flex flex-col justify-center">
            <div className="text-left space-y-12">
              <motion.h1
                initial={{ opacity: 0, scale: 0.5 }}
                whileInView={{ opacity: 1, scale: 1 }}
                viewport={{ once: true }}
                transition={{ duration: 0.5 }}
                className="text-4xl md:text-3xl font-bold leading-snug"
              >
                The World's Leading Platform for Infrastructure Reporting
              </motion.h1>
              <div className="flex flex-col gap-6">
                <motion.div
                  variants={FadeUp(0.2)}
                  initial="initial"
                  whileInView="animate"
                  viewport={{ once: true }}
                  className="flex items-center gap-4 p-6 bg-[#f4f4f4] rounded-2xl hover:bg-white duration-300 hover:shadow-2xl"
                >
                  <FaBookReader className="text-2xl" />
                  <p className="text-lg">10,000+ Reports Submitted</p>
                </motion.div>
                <motion.div
                  variants={FadeUp(0.4)}
                  initial="initial"
                  whileInView="animate"
                  viewport={{ once: true }}
                  className="flex items-center gap-4 p-6 bg-[#f4f4f4] rounded-2xl hover:bg-white duration-300 hover:shadow-2xl"
                >
                  <GrUserExpert className="text-2xl" />
                  <p className="text-lg">Expert Resolution Team</p>
                </motion.div>
                <motion.div
                  variants={FadeUp(0.6)}
                  initial="initial"
                  whileInView="animate"
                  viewport={{ once: true }}
                  className="flex items-center gap-4 p-6 bg-[#f4f4f4] rounded-2xl hover:bg-white duration-300 hover:shadow-2xl"
                >
                  <MdOutlineAccessTime className="text-2xl" />
                  <p className="text-lg">Round-the-Clock Support</p>
                </motion.div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Login Modal */}
      <LoginScreen isOpen={isLoginOpen} onClose={handleLoginClose} />
      {/* Sign Up Modal */}
      <SignUp isOpen={isSignupOpen} onClose={handleSignupClose} />
    </main>
  );
};

export default Home;
