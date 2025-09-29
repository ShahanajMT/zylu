const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const connectDB = require('./src/cofig/db');

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// MongoDB connection
connectDB();

// Routes
const employeeRouter = require('./src/routes/employeeRouter');
app.use('/api/employees', employeeRouter);

app.listen(PORT, () => {
  console.log(`Server is running on port: ${PORT}`);
});