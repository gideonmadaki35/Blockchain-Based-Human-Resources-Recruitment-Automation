# Blockchain-Based Human Resources Recruitment Automation

A comprehensive blockchain-based HR recruitment system built with Clarity smart contracts for the Stacks blockchain. This system automates the entire recruitment process from agency verification to final hiring decisions.

## 🚀 Features

### Core Contracts

1. **Agency Verification Contract** (`agency-verification.clar`)
    - Register recruitment agencies
    - Verify agency credentials
    - Manage agency status and permissions

2. **Candidate Sourcing Contract** (`candidate-sourcing.clar`)
    - Register candidates with skills and experience
    - Track candidate status throughout the process
    - Link candidates to verified agencies

3. **Screening Automation Contract** (`screening-automation.clar`)
    - Define screening criteria for job positions
    - Automatically score candidates against criteria
    - Generate screening reports and recommendations

4. **Interview Scheduling Contract** (`interview-scheduling.clar`)
    - Schedule interviews between candidates and interviewers
    - Manage interviewer availability
    - Track interview status and outcomes

5. **Hiring Decision Contract** (`hiring-decision.clar`)
    - Make final hiring decisions
    - Create and manage job offers
    - Track offer acceptance/rejection

## 🏗️ Architecture

The system follows a modular architecture where each contract handles a specific aspect of the recruitment process:

\`\`\`
Agency Registration → Candidate Sourcing → Screening → Interview → Hiring Decision
\`\`\`

### Data Flow

1. **Agency Registration**: Recruitment agencies register and get verified
2. **Candidate Sourcing**: Verified agencies add candidates to the system
3. **Screening**: Candidates are automatically screened against job criteria
4. **Interview Scheduling**: Qualified candidates are scheduled for interviews
5. **Hiring Decision**: Final decisions are made and offers are extended

## 🛠️ Installation

### Prerequisites

- Node.js (v16 or higher)
- Clarinet CLI
- Stacks Wallet

### Setup

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd hr-blockchain-system
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Initialize Clarinet project:
   \`\`\`bash
   clarinet new hr-recruitment
   cd hr-recruitment
   \`\`\`

4. Copy contract files to the contracts directory

## 🧪 Testing

Run the test suite using Vitest:

\`\`\`bash
npm test
\`\`\`

### Test Coverage

- Agency verification functionality
- Candidate registration and management
- Screening automation
- Interview scheduling
- Hiring decision processes

## 📋 Usage

### 1. Register an Agency

\`\`\`clarity
(contract-call? .agency-verification register-agency "TechRecruit Agency")
\`\`\`

### 2. Verify Agency (Admin only)

\`\`\`clarity
(contract-call? .agency-verification verify-agency u1)
\`\`\`

### 3. Register a Candidate

\`\`\`clarity
(contract-call? .candidate-sourcing register-candidate
"John Doe"
"john@example.com"
"JavaScript, React, Node.js"
u5
u1)
\`\`\`

### 4. Set Screening Criteria

\`\`\`clarity
(contract-call? .screening-automation set-screening-criteria
u3
"JavaScript, React"
u70)
\`\`\`

### 5. Screen a Candidate

\`\`\`clarity
(contract-call? .screening-automation screen-candidate u1 u1)
\`\`\`

### 6. Schedule Interview

\`\`\`clarity
(contract-call? .interview-scheduling schedule-interview
u1
'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5
u1000
u60)
\`\`\`

### 7. Make Hiring Decision

\`\`\`clarity
(contract-call? .hiring-decision make-hiring-decision
u1
"hire"
"Excellent technical skills"
(some u75000))
\`\`\`

## 🔒 Security Features

- **Access Control**: Role-based permissions for different user types
- **Data Integrity**: Immutable records on the blockchain
- **Transparency**: All actions are publicly verifiable
- **Decentralization**: No single point of failure

## 🌟 Benefits

### For Recruitment Agencies
- Verified credentials and reputation system
- Automated candidate screening
- Transparent process tracking
- Reduced administrative overhead

### For Employers
- Access to verified candidates
- Automated screening and scoring
- Transparent hiring process
- Immutable hiring records

### For Candidates
- Fair and transparent evaluation
- Permanent skill and experience records
- Direct access to opportunities
- Privacy-preserving data management

## 🔧 Configuration

### Environment Variables

Create a \`.env\` file with the following variables:

\`\`\`
STACKS_NETWORK=testnet
CONTRACT_ADDRESS=your-contract-address
PRIVATE_KEY=your-private-key
\`\`\`

### Contract Deployment

Deploy contracts in the following order:

1. agency-verification
2. candidate-sourcing
3. screening-automation
4. interview-scheduling
5. hiring-decision

## 📊 Monitoring and Analytics

The system provides built-in analytics for:

- Agency performance metrics
- Candidate success rates
- Screening effectiveness
- Interview completion rates
- Hiring decision patterns

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:

- Create an issue in the GitHub repository
- Join our Discord community
- Check the documentation wiki

## 🗺️ Roadmap

- [ ] Integration with external job boards
- [ ] Advanced AI-powered screening
- [ ] Multi-signature hiring approvals
- [ ] Candidate feedback system
- [ ] Performance analytics dashboard
- [ ] Mobile application interface

## 📈 Performance

The system is optimized for:

- Low transaction costs
- Fast processing times
- Scalable architecture
- High availability
- Data consistency

---

Built with ❤️ using Clarity and the Stacks blockchain.
\`\`\`
\`\`\`

Finally, let's create the PR details file:
