import { describe, it, expect } from 'vitest';

describe('Netflix Clone Smoke Test', () => {
  it('deve validar que o ambiente de teste está configurado corretamente', () => {
    const soma = 1 + 1;
    expect(soma).toBe(2);
  });

  it('deve confirmar que a aplicação pode rodar testes de lógica', () => {
    const appName = "Netflix Clone";
    expect(appName).toContain("Netflix");
  });
});