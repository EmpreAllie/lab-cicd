#include <iostream>
#include <vector>
#include <map>
#include <chrono>
#include <thread>

// Библиотеки для мониторинга
#include <prometheus/exposer.h>
#include <prometheus/registry.h>
#include <prometheus/counter.h>

using namespace std;

int main() {
    using namespace prometheus;

    // 1. Настройка мониторинга (для отчета)
    Exposer exposer{"0.0.0.0:8080"};
    auto registry = std::make_shared<Registry>();
    auto& counter_family = BuildCounter()
                               .Name("array_intersections_total")
                               .Help("Total number of array intersection calculations")
                               .Register(*registry);
    auto& process_counter = counter_family.Add({{"variant", "custom"}});
    exposer.RegisterCollectable(registry);

    // 2. Твоя основная логика
    vector<int> P = {1, 2, 3, 4, 5};
    vector<int> Q = {2, 1, 0, -1, -2, -3};
    vector<int> R = {5, -1, 10, 2};

    process_counter.Increment(); // Увеличиваем счетчик при запуске

    map<int, int> counts;
    for (vector<int>* v : {&P, &Q, &R}) {
        for (const int& el : *v) {
            counts[el]++;
        }
    }

    vector<int> res;
    cout << "Numbers in exactly two arrays: ";
    for (auto const& [val, count] : counts) {
        if (count == 2) {
            res.push_back(val);
            cout << val << " ";
        }
    }
    cout << endl;

    // 3. Задержка, чтобы Prometheus успел забрать данные в K8s
    std::this_thread::sleep_for(std::chrono::seconds(60));

    return 0;
}
