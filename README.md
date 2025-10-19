# Fluxo de Caixa Pessoal com Projeção

Um app simples e prático para organizar suas finanças, visualizar seu saldo acumulado dia a dia e projetar seu fluxo de caixa, ajudando você a tomar decisões financeiras mais conscientes **hoje**.

## 💡 Propósito

Este app nasceu da necessidade de entender, em tempo real, **como cada decisão financeira afeta meu caixa no curto e médio prazo**.
Em vez de apenas registrar o passado, ele projeta o futuro com base em:
- Transações reais já ocorridas
- Despesas e receitas fixas recorrentes
- Uma estimativa diária de gastos variáveis

Tudo em uma única visão: **uma linha do tempo de dias com saldo acumulado**.

## 🧩 Funcionalidades (MVP)

### 📅 Página principal: Fluxo de Caixa
- Exibe todos os dias do **início do mês passado** até **12 meses à frente**
- Para cada dia:
  - Mostra transações lançadas (receitas, despesas fixas, gastos diários)
  - Exibe o **saldo acumulado até aquele dia**
  - Se não houver gasto diário real, mostra uma **projeção com base na estimativa diária** (válido para dias **futuros**, envidentemente).
- Clique em qualquer dia para adicionar ou editar transações

### ⚙️ Página de Configurações
- Define sua **estimativa diária de gastos variáveis** (ex: R$60/dia)
- Gerencia **regras recorrentes**:
  - Ex: “Aluguel – R$1750 – todo dia 5”, "Salário - R$5000 - todo dia 01"

### 📊 Lógica de cálculo
- **Saldo acumulado** = saldo do dia anterior + soma das transações do dia
- Receitas (`income`) **aumentam** o saldo
- Despesas (`fixed_expense`, `daily_expense`) **diminuem** o saldo

## 🗃️ Modelos principais

- **`Transaction`**
  - `date` (data da transação)
  - `amount` (valor positivo)
  - `description`
  - `kind`: `income` | `fixed_expense` | `daily_expense`

- **`RecurringRule`**
  - `description`
  - `amount`
  - `kind`: `fixed_income` | `fixed_expense`
  - `month_day`

- **`Preference`**
  - `daily_expense_estimate` (ex: 60.0)

## 🎯 Princípios do projeto

- **Simplicidade primeiro**: nada de categorias, orçamentos ou gráficos complexos no início
- **Projeção útil**: o futuro é projetado de forma simples e objetiva, facilitando a toma de de decisão **hoje**
- **Ajuste contínuo**: conforme os dias passam, você substitui projeções pelo que realmente aconteceu
