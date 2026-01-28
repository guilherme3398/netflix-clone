// import { defineConfig } from 'vite'
// import react from '@vitejs/plugin-react'
// import tsconfigPaths from 'vite-tsconfig-paths'

// // https://vitejs.dev/config/
// export default defineConfig({
//   plugins: [react(), tsconfigPaths()]
// })

import { defineConfig } from 'vitest/config' 
import react from '@vitejs/plugin-react'
import tsconfigPaths from 'vite-tsconfig-paths'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), tsconfigPaths()],
  test: {
    globals: true,             
    environment: 'jsdom',      
    setupFiles: './src/tests/setup.ts', 
    coverage: {
      provider: 'v8',          
      reporter: ['text', 'lcov'], 
      include: ['src/**/*'],   
      exclude: [               
        'node_modules/**',
        'dist/**',
        '**/*.d.ts',
        'src/main.tsx',
        'src/vite-env.d.ts'
      ],
    },
  },
})