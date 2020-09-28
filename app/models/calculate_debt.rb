class CalculateDebt < ApplicationRecord
    before_save :select_action
    def select_action
        trate = self.rate * 0.01
        if self.monthly_payements == 0 || self.monthly_payements == nil
                r_and_k = trate/self.compounds_per_year #r/k
                r_and_k_plus = 1 + r_and_k #1 + r/k
            
            
                years =  -self.number_of_year #-n
                n_times_k = years * self.compounds_per_year #-nk
        
                inside = r_and_k_plus**n_times_k #(1+r/k)^-nk
                minus = 1-inside #(1-(1+r/k)^-nk)
                sum = minus / r_and_k 
                sum = sum/ self.principle
                sum = 1/sum 
                
                self.monthly_payements = sum

        elsif self.principle == 0 || self.principle == nil
            
                r_and_k = trate/self.compounds_per_year #r/k
                r_and_k_plus = 1 + r_and_k #1 + r/k
                
                
                years =  -self.number_of_year #-n
                n_times_k = years * self.compounds_per_year #-nk

                inside = r_and_k_plus**n_times_k

                minus = 1-inside

                sum = self.monthly_payements * minus

                sum = sum /r_and_k
                self.principle = sum

        end
    end

    def calculate_monthly_payements
        trate = self.rate *0.01
        r_and_k = trate/self.compounds_per_year #r/k
        r_and_k_plus = 1 + r_and_k #1 + r/k
       
       
        years =  -self.number_of_year #-n
        n_times_k = years * self.compounds_per_year #-nk
 
        inside = r_and_k_plus**n_times_k #(1+r/k)^-nk
        minus = 1-inside #(1-(1+r/k)^-nk)
        sum = minus / r_and_k 
        sum = sum/ self.principle
        sum = 1/sum 
        
        self.monthly_payements = sum

    end
    
    def calculate_principle
       trate = self.rate *0.01
       r_and_k = trate/self.compounds_per_year #r/k
       r_and_k_plus = 1 + r_and_k #1 + r/k
      
      
       years =  -self.number_of_year #-n
       n_times_k = years * self.compounds_per_year #-nk

       inside = r_and_k_plus**n_times_k

       minus = 1-inside

       sum = self.monthly_payements * minus

       sum = sum /r_and_k
       self.principle = sum
    end
end
