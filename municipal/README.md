# Municipal

A Crowd-sourced Infrastructure Application

# Project Setup Guide

## Prerequisites
- **Node.js**: Install [Node.js](https://nodejs.org/). This will also install npm (Node Package Manager) which is required for installing the Amplify CLI.
  - Verify installation by running:
    ```bash
    node -v
    npm -v
    ```

- **AWS Amplify CLI**: Install globally via npm:
    ```bash
    npm install -g @aws-amplify/cli
    ```

- **Flutter**: Install Flutter from the [official site](https://flutter.dev/docs/get-started/install).
  - Verify installation by running:
    ```bash
    flutter doctor
    ```

- **Git**: Ensure you have Git installed by running:
    ```bash
    git --version
    ```

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
1. **Install Node.js dependencies**:
   - If your project contains a `package.json` file for frontend or Amplify-related dependencies, run the following command to install the npm dependencies:
     ```bash
     npm install
     ```

2. **Flutter Dependencies**: 
   - Run the following command to install Flutter dependencies:
     ```bash
     flutter pub get
     ```

---

## Step 3: Set Up AWS Amplify
1. **Sign in to AWS**: Make sure you have access to an AWS account and are signed in.

2. **Configure Amplify CLI** (if not already configured):
   - If this is your first time using the Amplify CLI, configure it with your AWS credentials:
     ```bash
     amplify configure
     ```
   - Follow the on-screen instructions to set up your AWS profile, region, and permissions.

3. **Amplify Initialization**:
   - Run the following command to pull the backend environment from AWS into your local environment:
     ```bash
     amplify pull
     ```
   - Follow the prompts:
     - **Select your authentication method**: Choose `AWS profile`.
     - **Choose your AWS profile**: Select the profile you want to use (the one you set up in the previous step).
     - Amplify will download the necessary backend configurations to your project.

---

## Step 4: Configure Environment Variables (If Any)
1. If there are any environment variables or secrets required for your app, set them up in a `.env` file or as specified in the project documentation.
2. If your project uses Amplify secrets (for example, in Lambda functions), ensure that the necessary environment variables are set up through the Amplify CLI or AWS console.

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
     flutter run -d chrome
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

- **Add New Backend Features**:
   To add new Amplify categories (such as storage, API, etc.), run:
    ```bash
    amplify add <category>
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
  - **Check Node.js installation**: Ensure that `node` and `npm` are installed correctly by running:
    ```bash
    node -v
    npm -v
    ```

---

## Resources
- [AWS Amplify Documentation](https://docs.amplify.aws/)
- [Flutter Documentation](https://flutter.dev/docs)
- [Node.js and npm Documentation](https://nodejs.org/en/docs/)
