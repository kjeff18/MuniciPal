# municipal

A Crowd-sourced Infrastructure Application

# Project Setup Guide

## Prerequisites
- **Node.js**: Install [Node.js](https://nodejs.org/).
- **AWS Amplify CLI**: Install via npm: 
    ```bash
    npm install -g @aws-amplify/cli
    ```
- **Flutter**: Install Flutter from the [official site](https://flutter.dev/docs/get-started/install).
- **Git**: Ensure you have Git installed.

---

## Step 1: Clone the Repository
1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the project.
3. Run the following command to clone the repo:
    ```bash
    git clone <repository-url>
    ```
   Replace `<repository-url>` with the actual URL of the GitHub repository.

4. Navigate to the project directory:
    ```bash
    cd <project-directory>
    ```

---

## Step 2: Install Dependencies
1. **Flutter Dependencies**: 
   - Run the following command to install Flutter dependencies:
     ```bash
     flutter pub get
     ```

---

## Step 3: Set Up AWS Amplify
1. **Sign in to AWS**: Make sure you have access to an AWS account and are signed in.
   
2. **Amplify Initialization**:
   - Run the following command to configure Amplify for your local environment:
     ```bash
     amplify pull
     ```
   - Follow the prompts:
     - **Select your authentication method**: Choose `AWS profile`.
     - **Choose your AWS profile**: Select the AWS profile you want to use.
     - Amplify will download the necessary backend configurations.

3. **Configure Amplify CLI** (if prompted):
   - You may be prompted to configure the Amplify CLI.
     - Follow the on-screen instructions to set up your default AWS region and profile.

---

## Step 4: Configure Environment Variables (If Any)
1. If there are any environment variables or secrets required for your app, set them up in a `.env` file or as specified in the project documentation.

---

## Step 5: Run the Flutter App
1. **Mobile (Android or iOS)**:
   - Connect your mobile device or start an emulator.
   - Run the following command to start the app:
     ```bash
     flutter run
     ```

2. **Web**:
   - To run the app in a web browser, use:
     ```bash
     flutter run -d web
     ```

---

## Step 6: Amplify Commands for Development (Optional)
- **Push changes to the backend**: 
   If you make any changes to the Amplify configuration, remember to push those changes:
    ```bash
    amplify push
    ```

- **Check Amplify Status**:
    ```bash
    amplify status
    ```

---

## Troubleshooting
- If you face any issues during setup, try the following:
  - **Re-run Amplify pull**:
    ```bash
    amplify pull
    ```
  - **Ensure correct AWS profile is configured**:
    ```bash
    amplify configure
    ```
  - **Check for Flutter SDK issues**: 
    - Run `flutter doctor` to diagnose any problems with your Flutter environment.

---

## Resources
- [AWS Amplify Documentation](https://docs.amplify.aws/)
- [Flutter Documentation](https://flutter.dev/docs)

