/** @type {import('next').NextConfig} */
const nextConfig = {
	output: 'standalone',
	async rewrites() {
		return [
			{
				source: '/api/:path*',
				destination: 'http://backend:3000/api/:path*', // change 'backend' to your backend service name if needed
			},
		];
	},
};

module.exports = nextConfig;