/**
 * Exercise 01: [Exercise Name] - SOLUTION
 * 
 * This is the complete solution for Exercise 01.
 * Compare your implementation with this one to learn
 * different approaches and best practices.
 */

// Import required modules
const moduleA = require('./moduleA');
const { validateInput } = require('./utils');

/**
 * Main function that demonstrates the concept
 * 
 * @param {string} param1 - First parameter description
 * @param {number} param2 - Second parameter description
 * @returns {object} Processed result
 */
function mainFunction(param1, param2) {
  // Input validation
  if (!validateInput(param1, param2)) {
    throw new Error('Invalid input parameters');
  }

  // Process the data
  const processed = {
    original: param1,
    transformed: param1.toUpperCase(),
    calculated: param2 * 2,
    timestamp: new Date().toISOString()
  };

  // Apply business logic
  const result = helperFunction(processed);

  return result;
}

/**
 * Helper function that applies additional processing
 * 
 * @param {object} input - Processed data object
 * @returns {object} Enhanced result
 */
function helperFunction(input) {
  return {
    ...input,
    status: 'completed',
    score: calculateScore(input.calculated)
  };
}

/**
 * Calculate score based on value
 * 
 * @param {number} value - Input value
 * @returns {string} Score category
 */
function calculateScore(value) {
  if (value > 100) return 'excellent';
  if (value > 50) return 'good';
  return 'needs improvement';
}

// Export functions
module.exports = {
  mainFunction,
  helperFunction,
  calculateScore
};

// Example usage
if (require.main === module) {
  try {
    const result = mainFunction('Hello Workshop', 42);
    console.log('Result:', JSON.stringify(result, null, 2));
  } catch (error) {
    console.error('Error:', error.message);
  }
}
